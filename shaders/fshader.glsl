#version 150

uniform vec4 AmbientProduct;
uniform vec4 DiffuseProduct;
uniform vec4 SpecularProduct;
uniform vec4 LightPosition;
uniform float Shininess;

in vec4 pos;
in vec4 N;

out vec4 fragColor;

void main()
{
  
  // Ambient
  vec4 ambient = AmbientProduct;
  
  // Diffuse
  float Kd = 1.0;
  float dotDiffuse = float(dot(N,LightPosition));
  //vec4  diffuse = Kd*DiffuseProduct;
  vec4 diffuse= DiffuseProduct * dotDiffuse;
  //Specular
  vec4 reflection = (-pos) - 2*float(dot(-pos,N))*N;
  float dotSpecular = float(dot(reflection,pos));
  float Ks = pow(dotSpecular,Shininess);
  vec4  specular = 0.0*SpecularProduct * Ks;
  
  fragColor = ambient + diffuse + specular;
}

