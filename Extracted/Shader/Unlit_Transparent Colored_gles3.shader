//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Transparent Colored" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" { }
_Color ("Color", Color) = (1,1,1,1)
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 16593
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_0 = u_xlat16_0 * _Color;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_0 = u_xlat16_0 * _Color;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_0 = u_xlat16_0 * _Color;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
}
}
}
}