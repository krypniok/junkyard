#!/usr/bin/php
<?php 

function file_get_contents_curl($url) {
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_AUTOREFERER, TRUE);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);       

    $data = curl_exec($ch);
    curl_close($ch);

    return $data;
}

function fetchLinksFromDesktopNexus($url)
{
    // Fetch the HTML content of the URL
    $html = file_get_contents_curl($url);


    // Extract the number of total pages using regular expressions
    $pattern = '/\((\d+(?:,\d+)?) Total Pages\)/';
    preg_match($pattern, $html, $matches);
    if (!empty($matches)) {
        $totalPages = str_replace(',', '', $matches[1]);
        echo "Total Pages: $totalPages\n";
    } else {
        echo "Failed to retrieve the number of total pages.\n";
        return [];
    }

    // Generate a random page number within the range
    $randomPage = mt_rand(1, $totalPages);
    echo "Random Page Number: $randomPage\n";

    // Construct the URL with the random page number
    $randomUrl = "https://nature.desktopnexus.com/cat/beaches/$randomPage";

    // Fetch the HTML content of the random page
    $randomHtml = file_get_contents_curl($randomUrl);

    // Find all anchor tags in the HTML
    preg_match_all('/<a\b[^>]+\bhref\s*=\s*["\']\/\/nature\.desktopnexus\.com\/wallpaper\/([^"\']+)["\']\s+alt\s*=\s*["\']([^"\']+)["\'][^>]*>/i', $randomHtml, $matches);

    // Extract the href and alt attributes from the matches
    $links = [];
    foreach ($matches[1] as $index => $match) {
        $id = $match;

        // Strip the last character if it is not a digit
        if (!ctype_digit(substr($id, -1))) {
            $id = substr($id, 0, -1);
        }

        $href = 'https://nature.desktopnexus.com/wallpaper/' . $match;
        $alt = $matches[2][$index];
        $links[] = [
            'id' => $id,
            'href' => $href,
            'alt' => $alt,
        ];
    }

    // Return the links
    return $links;
}

function getDownloadLink($id, $width, $height)
{
    $url = 'https://nature.desktopnexus.com/get_wallpaper_download_url.php?id=' . $id . '&w=' . $width . '&h=' . $height;
    $response = file_get_contents_curl($url);

    // Check if the response is valid and contains a download link
    if ($response !== false && filter_var($response, FILTER_VALIDATE_URL)) {
        return $response;
    }

    return $response; // Return null if the download link is not found or the response is invalid
}

function downloadImage($url, $savePath)
{
    $ch = curl_init($url);
    $fp = fopen($savePath, 'wb');

    curl_setopt($ch, CURLOPT_FILE, $fp);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_exec($ch);

    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    curl_close($ch);
    fclose($fp);

    return $httpCode;
}

function susy($cmd) {
    global $USRPWD;
    system("echo '$USRPWD' | sudo -S $cmd");

}

_start:

echo "working dir = " . dirname(__FILE__) . "\n";

// URL to fetch links from
$USRPWD = 'simon';
$url = 'https://nature.desktopnexus.com/cat/beaches/';

// Fetch the links from the URL
$links = fetchLinksFromDesktopNexus($url);


// Output the links and download a random image
if (!empty($links)) {
    echo "Links found on Desktop Nexus:\n";

    // Select a random link from the array
    $randomIndex = array_rand($links);
    $randomLink = $links[$randomIndex];

    echo "URL: " . $randomLink['href'] . "\n";
    echo "Alt: " . $randomLink['alt'] . "\n";
   // system("espeak \"" . $randomLink['alt'] . "\"");

    // Download the original size image
    $downloadLink = getDownloadLink($randomLink['id'], 1920, 1080);
    if ($downloadLink) {
        echo "Download Link: " . $downloadLink . "\n";

        // Specify the save path for the downloaded image
        $parts = parse_url($downloadLink);
        $path = $parts['path'];

        //susy("mkdir ramdisk");
        susy("mount -t tmpfs -o size=4M none ramdisk/");

        $savePath = "ramdisk/" . $randomLink['id'] . '-1920x1080-' . $randomLink['alt'] . '.jpg';

        // Download the image using cURL
        $httpCode = downloadImage($downloadLink, $savePath);

        if ($httpCode === 200) {
            echo "Image downloaded successfully. Saved as: " . $savePath . "\n";

            // Set the image as the desktop wallpaper using gsettings
            shell_exec("gsettings set org.gnome.desktop.background picture-uri \"file:///home/simon/Dokumente/Skripte/Sandbox/wallpaper/$savePath\"");
            echo "Desktop wallpaper set successfully.\n";
        } else {
            echo "Failed to download the image.\n";
        }

        susy("sleep 1");
        susy("umount ramdisk");
       // susy("rmdir ramdisk");

    } else {
        echo "Failed to retrieve the download link.\n";
    }

    echo "\n";
} else {
    echo "No links found on Desktop Nexus.\n";
    goto _start;
}

sleep(15);
goto _start;

?>
