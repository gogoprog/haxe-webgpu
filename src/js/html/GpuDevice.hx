package js.html;

private typedef RenderPipelineDescriptor = {
    var layout:String;
    var vertex:Dynamic;
    var fragment:{
        module:GpuShaderModule,
        entryPoint:String,
        targets:Array<Dynamic>
    };
    var primitive:Dynamic;
};

private typedef ShaderModuleDescriptor = {
    var code:String;
};

extern class GpuDevice {
    public function createCommandEncoder():GpuCommandEncoder;
    public function createRenderPipeline(descriptor:RenderPipelineDescriptor):GpuRenderPipeline;
    public function createShaderModule(descriptor:ShaderModuleDescriptor):GpuShaderModule;
    public var queue:GpuQueue;
}
