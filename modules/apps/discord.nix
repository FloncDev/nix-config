{ inputs, ... }:
{
  flake-file.inputs = {
    nixcord.url = "github:kaylorben/nixcord";
  };

  flake.modules.homeManager.discord =
    { pkgs, ... }:
    {
      imports = [
        inputs.nixcord.homeModules.nixcord
      ];

      programs.nixcord = {
        enable = true;
        vesktop = {
          enable = true;

          #   package =
          #     (pkgs.vesktop.override {
          #       # Ensure your nixpkgs channel has electron_41, or match it to your current pkgs version
          #       electron_40 = pkgs.electron_41;
          #     }).overrideAttrs
          #       (_: rec {
          #         src = pkgs.fetchFromGitHub {
          #           owner = "Vencord";
          #           repo = "Vesktop";
          #           rev = "797c02bdd0d35063ac76d75cffa77b0790f3a657";
          #           hash = "sha256-xeeg1U0+1lfJxTZQsY5Y49aM66Qp/1zqVkKSiewSxJk=";
          #         };
          #         pnpmDeps = pkgs.fetchPnpmDeps {
          #           pname = "vesktop";
          #           version = "1.6.5";
          #           inherit src;
          #           patches = [ ];
          #           pnpm = pkgs.pnpm_10_29_2;
          #           fetcherVersion = 3;
          #           hash = "sha256-nOwl/e5lL8UGjwUexm/EiA7cPmWYif9PHwa0vAX5VbM=";
          #         };
          #       });
        };

        config = {
          themeLinks = [
            "https://catppuccin.github.io/discord/dist/catppuccin-mocha-mauve.theme.css"
          ];

          plugins = {
            betterFolders.enable = false;
            accountPanelServerProfile.enable = true;
            betterRoleContext.enable = true;
            betterSessions.enable = true;
            biggerStreamPreview.enable = true;
            BlurNSFW.enable = true;
            callTimer.enable = true;
            ClearURLs.enable = true;
            consoleShortcuts.enable = true;
            copyFileContents.enable = true;
            dontRoundMyTimestamps.enable = true;
            experiments.enable = true;
            fakeNitro.enable = true;
            favoriteEmojiFirst.enable = true;
            fixCodeblockGap.enable = true;
            fixSpotifyEmbeds.enable = true;
            fixYoutubeEmbeds.enable = true;
            forceOwnerCrown.enable = true;
            fullSearchContext.enable = true;
            gameActivityToggle.enable = true;
            greetStickerPicker.enable = true;
            imageZoom.enable = true;
            memberCount.enable = true;
            mentionAvatars.enable = true;
            messageClickActions.enable = true;
            messageLatency.enable = true;
            messageLinkEmbeds.enable = true;
            messageLogger.enable = true;
            # messageTags.enable = true;
            # moreKaomoji.enable = true;
            # moreUserTags.enable = true;
            # noScreensharePreview.enable = true;
            notificationVolume.enable = true;
            noUnblockToJump.enable = true;
            OnePingPerDM.enable = true;
            openInApp.enable = true;
            platformIndicators.enable = true;
            previewMessage.enable = true;
            quickReply.enable = true;
            relationshipNotifier.enable = true;
            replyTimestamp.enable = true;
            sendTimestamps.enable = true;
            serverInfo.enable = true;
            shikiCodeblocks.enable = true;
            spotifyControls.enable = true;
            spotifyCrack.enable = true;
            spotifyShareCommands.enable = true;
            typingIndicator.enable = true;
            unindent.enable = true;
            viewIcons.enable = true;
            viewRaw.enable = true;
            voiceChatDoubleClick.enable = true;
            voiceDownload.enable = true;
            voiceMessages.enable = true;
            volumeBooster.enable = true;
            whoReacted.enable = true;
            youtubeAdblock.enable = true;
          };
        };
      };
    };
}
