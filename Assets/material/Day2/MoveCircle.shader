Shader "Custom/CircleShader"
{
	//ここに書くとインスペクタから指定できるようになる
	Properties{
		_MainTex("Texture",2D)="white"{}
	}
    SubShader
    {
		Tags { "RenderType" = "Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard 
        #pragma target 3.0
        struct Input
        {
			float3 worldPos;
        };
		//1ピクセルごとにこのメソッドが実行される
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			float dist = distance(fixed3(0, 0, 0), IN.worldPos);
			float radius = 4*sin(_Time.z);
			if (radius < dist) {
				o.Albedo = fixed4(0, 0, 0, 1);
			}
			else if(radius - 1 > dist){
				o.Albedo = fixed4(0, 0, 0, 1);
			}
			else {
				o.Albedo = fixed4(1, 1, 1, 1);
			}
        }
        ENDCG
    }
    FallBack "Diffuse"
}
