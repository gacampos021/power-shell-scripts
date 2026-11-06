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