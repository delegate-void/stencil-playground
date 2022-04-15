Shader "01/X-Ray (Subject - BackFace)"
{
    Properties
    {
        _RayColor("Ray Color", Color) = (1,1,1,1)
        [IntRange] _StencilIDToRead ("Stencil ID (Read)", Range(0, 255)) = 0
        [MaterialEnum(Off,0,Back,1,Front,2)] _Cull("Cull", Int) = 2
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue" = "Transparent" "RenderPipeline" = "UniversalPipeline" }

        Pass
        {
            Cull Front
            ZTest Always
            ZWrite Off
            Blend SrcAlpha OneMinusSrcAlpha

            Stencil
            {
                Ref [_StencilIDToRead]
                Comp Less
                Pass Replace
                Fail Keep
            }
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };

            float4 _RayColor;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return _RayColor;
            }
            ENDCG
        }
    }
}
