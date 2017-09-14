## Installing Google translation importer

```bash
composer require creativestyle/magento2-translation-importer
```

## Configuring Google Docs
```bash
bin/configure-google-sheet.sh google_client_id GOOGLE_CLIENT_ID
bin/configure-google-sheet.sh google_client_secret GOOGLE_CLIENT_SECRET
bin/configure-google-sheet.sh spreadsheet_id SPREADSHEET_ID
```

additionally for the automated tasks, the access and refresh tokens shall be configured:

```bash
bin/configure-google-sheet.sh google_access_token GOOGLE_ACCESS_TOKEN
bin/configure-google-sheet.sh google_refresh_token GOOGLE_REFRESH_TOKEN
```

## Cloning language package repository
```bash
git clone -b LANGUAGE_PACKAGE_REPOSITORY_BRANCH LANGUAGE_PACKAGE_REPOSITORY_URL tmp/language_package
```

## Downloading and merging with existing translations
```bash
bin/merge.sh LANGUAGE tmp/language_package
```

If during the Google Docs configuration step you didn't provide access and refresh token, you will be asked to open
an authorization URL in your browser and to paste the generated authorization code.

## Commiting changes to the repository
```bash
cd tmp/language_package
git add .
git commit -m "Update wordings"
git push origin 
```
