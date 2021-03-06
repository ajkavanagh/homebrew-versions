cask 'android-studio-canary' do
  version '2.1.0.3,143.2730271'
  sha256 'f8bff65f08e55f3990958f43ed52dad040d5b7aedfbde1dd2859b6747b4ffd01'

  url "https://dl.google.com/dl/android/studio/ide-zips/#{version.before_comma}/android-studio-ide-#{version.after_comma}-mac.zip"
  name 'Android Studio Canary'
  homepage 'https://sites.google.com/a/android.com/tools/download/studio/canary'
  license :apache

  app 'Android Studio.app'

  zap delete: [
                "~/Library/Preferences/AndroidStudioPreview#{version.major_minor}",
                '~/Library/Preferences/com.google.android.studio.plist',
                "~/Library/Application Support/AndroidStudioPreview#{version.major_minor}",
                "~/Library/Logs/AndroidStudioPreview#{version.major_minor}",
                "~/Library/Caches/AndroidStudioPreview#{version.major_minor}",
              ],
      rmdir:  '~/AndroidStudioProjects'

  caveats do
    depends_on_java
  end
end
