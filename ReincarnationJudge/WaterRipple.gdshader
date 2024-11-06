shader_type canvas_item;

uniform vec2 wave_center ; // 波纹中心位置
uniform vec2 TEXTURE_SIZE ; // 波纹中心位置
uniform float wave_radius : hint_range(0.0, 100.0) = 10.0; // 波纹的初始半径
uniform float wave_speed : hint_range(0.01, 10.0) = 1.0; // 波纹扩散的速度
uniform float wave_amplitude : hint_range(0.0, 1.0) = 0.1; // 波纹的振幅

void fragment() {
    // 获取UV坐标，并将其映射到0-1范围内
    vec2 uv = UV * TEXTURE_SIZE;
    
    // 计算从波纹中心到当前点的距离
    float distance = length(uv - wave_center);
    
    // 计算波纹的“年龄”，即当前点到波前的距离除以速度
    float age = (distance - wave_radius) / wave_speed;
    
    // 如果当前点还在波前之后（即age < 0），则应用波纹效果
    if (age < 0.0) {
        // 使用时间和距离来计算波纹的高度（振幅）
        float wave_height = sin(age * 2.0 * PI + TIME) * wave_amplitude;
        
        // 调整UV坐标以应用波纹效果
        // 注意：这里我们只在y方向上调整，以创建垂直的波纹效果
        uv.y += wave_height * (wave_radius / distance); // 使用距离来缩放振幅，使波纹看起来更自然
        
        // 使用调整后的UV坐标来采样纹理
        COLOR = texture(TEXTURE, uv / TEXTURE_SIZE); // 别忘了将UV坐标重新映射回0-1范围
    } else {
        // 如果当前点已经在波前之前，则使用原始纹理颜色
        COLOR = texture(TEXTURE, UV);
    }
}