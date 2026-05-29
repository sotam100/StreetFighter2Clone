using System.IO;
using UnityEditor;
using UnityEditor.Build.Reporting;

public static class BuildWebGL
{
    private static readonly string[] Scenes = new[]
    {
        "Assets/Scenes/MensajeInicial.unity",
        "Assets/Scenes/Intro.unity",
        "Assets/Scenes/Menu.unity",
        "Assets/Scenes/TransicionInicio.unity",
        "Assets/Scenes/Tran_Perdiste.unity",
        "Assets/Scenes/Tran_Ganaste.unity",
        "Assets/Scenes/Combates.unity",
        "Assets/Scenes/Bonus_1.unity",
        "Assets/Scenes/Bonus_2.unity",
        "Assets/Scenes/Bonus_3.unity",
        "Assets/Scenes/Continuar.unity",
        "Assets/Scenes/Finales.unity"
    };

    public static void BuildGame()
    {
        var buildPath = Path.GetFullPath("Build/WebGL");
        if (!Directory.Exists(buildPath))
        {
            Directory.CreateDirectory(buildPath);
        }

        var report = BuildPipeline.BuildPlayer(Scenes, buildPath, BuildTarget.WebGL, BuildOptions.None);
        if (report.summary.result != BuildResult.Succeeded)
        {
            throw new System.Exception($"Unity WebGL build failed: {report.summary.result}");
        }
    }
}
