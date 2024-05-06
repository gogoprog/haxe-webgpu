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

private typedef BufferDescriptor = {
    var size:Int;
    var usage:Int;
};

extern class GpuDevice {
    public function createCommandEncoder():GpuCommandEncoder;
    public function createRenderPipeline(descriptor:RenderPipelineDescriptor):GpuRenderPipeline;
    public function createShaderModule(descriptor:ShaderModuleDescriptor):GpuShaderModule;
    public function createBuffer(descriptor:BufferDescriptor):GpuBuffer;
    public var queue:GpuQueue;
}
