package js.html;

private typedef Configuration = {
    var device:GpuDevice;
    var format:String;
    var alphaMode:String;
};

extern class GpuCanvasContext {
    public function configure(configuration:Configuration):Void;
    public function getCurrentTexture():Dynamic;
}
