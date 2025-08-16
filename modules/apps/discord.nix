{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;

    # discord = {
    #   enable = true;
    #   vencord.package = pkgs.vencord;
    #   openASAR.enable = true;
    # };

    vesktop = {
      enable = true;
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
        blurNSFW.enable = true;
        callTimer.enable = true;
        clearURLs.enable = true;
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
        friendsSince.enable = true;
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
        messageTags.enable = true;
        moreKaomoji.enable = true;
        moreUserTags.enable = true;
        # noScreensharePreview.enable = true;
        notificationVolume.enable = true;
        noUnblockToJump.enable = true;
        onePingPerDM.enable = true;
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
}
