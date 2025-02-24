﻿using Microsoft.UI.Xaml;
using NickvisionSpotlight.Shared.Controllers;
using NickvisionSpotlight.Shared.Models;
using NickvisionSpotlight.WinUI.Views;
using System;

namespace NickvisionSpotlight.WinUI;

/// <summary>
/// The App
/// </summary>
public partial class App : Application
{
    public static Window? MainWindow { get; private set; } = null;
    private readonly MainWindowController _mainWindowController;

    /// <summary>
    /// Constructs an App
    /// </summary>
    public App()
    {
        InitializeComponent();
        _mainWindowController = new MainWindowController();
        //AppInfo
        _mainWindowController.AppInfo.ID = "org.nickvision.spotlight";
        _mainWindowController.AppInfo.Name = "Nickvision Spotlight";
        _mainWindowController.AppInfo.ShortName = _mainWindowController.Localizer["ShortName"];
        _mainWindowController.AppInfo.Description = $"{_mainWindowController.Localizer["Description"]}.";
        _mainWindowController.AppInfo.Version = "2023.5.0";
        _mainWindowController.AppInfo.Changelog = "- Rewrote the application with a new design and better performance";
        _mainWindowController.AppInfo.GitHubRepo = new Uri("https://github.com/NickvisionApps/Spotlight");
        _mainWindowController.AppInfo.IssueTracker = new Uri("https://github.com/NickvisionApps/Spotlight/issues/new");
        _mainWindowController.AppInfo.SupportUrl = new Uri("https://github.com/NickvisionApps/Spotlight/discussions");
        //Theme
        if (_mainWindowController.Theme == Theme.Light)
        {
            RequestedTheme = ApplicationTheme.Light;
        }
        else if (_mainWindowController.Theme == Theme.Dark)
        {
            RequestedTheme = ApplicationTheme.Dark;
        }
    }

    /// <summary>
    /// Occurs when the app is launched
    /// </summary>
    /// <param name="args">LaunchActivatedEventArgs</param>
    protected override void OnLaunched(LaunchActivatedEventArgs args)
    {
        MainWindow = new MainWindow(_mainWindowController);
        MainWindow.Activate();
    }
}
