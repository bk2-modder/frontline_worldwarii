SunFlare()
{
	Angle(120.0, 60.0);
	Color(255, 255, 255);
	Size(5.0);
	FlareOutSize(20.0);
	NumFlareOuts(40);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(10.0, 246, 237, 144, 128);
	HaloOutterRing(30.0, 130, 76, 0, 0);
	SpikeColor(230,230,0,128);
	SpikeSize(20.0);

}

Decal("decal_explosion")
{
    Texture("decal_explosion_scorch");
    BumpTexture("decal_explosion_crack_bump");
    Lifetime(60.0);
    FadeInTime(1.0);
    FadeOutTime(6.0);
    MaxDecals(50);
    Color(255,255,255,255);
}

Decal("decal_atst_footprint")
{
    BumpTexture("atst_footprint_bump");
    Lifetime(10.0);
    FadeInTime(0.0);
    FadeOutTime(6.0);
    MaxDecals(50);
    Color(255,255,255,255);
}

Decal("decal_tauntaun_footprint")
{
    BumpTexture("beast_footprint_bump");
    Lifetime(10.0);
    FadeInTime(0.0);
    FadeOutTime(6.0);
    MaxDecals(100);
    Color(255,255,255,255);
}