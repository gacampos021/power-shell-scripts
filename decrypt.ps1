$encryptionKey = [Text.Encoding]::UTF8.GetBytes("MyEnc")

$textToEncrypt = "Passerd123"

$bytesToEncrypt = [Text.Encoding]::UTF8.GetBytes($textToEncrypt)

$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
$aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7

$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
$aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7

$aes.GenerateIV()

$encryptor = $aes.CreateEncryptor()

$encryptedBytes = $encryptor.TransformFinalBlock($bytesToEncrypt, 0, $bytesToEncrypt.Length)

$encryptedText = [Convert]::ToBase64String($aes.IV + $encryptedBytes)

Write-Host "Encrypyted: $encryptedText"


$encryptedBytesWithIV = [Convert]::FromBase64String($encryptedText)
$iv = $encryptedBytesWithIV[0..15]
$encryptedBytesOnly = $encryptedBytesWithIV[16..($encryptedBytesWithIV.Length - 1)]

$aes.IV = $iv
$decryptor = $aes.CreateDecryptor()
$decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytesOnly, 0, $encryptedBytesOnly.Length)

$decryptedText = [Text.Encoding]::UTF8.GetString($decryptedBytes)

Write-Host "Decrypted: $decryptedText"