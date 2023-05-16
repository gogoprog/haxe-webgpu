class Demo {
    static function main() {
        var vertexShader = "
        struct VSOutput {
            @builtin(position) position: vec4<f32>,
                     @location(0) color: vec4<f32>
        };

        const positions = array<vec2<f32>, 3>(
                              vec2(0.0,  0.5),
                              vec2(-0.5, -0.5),
                              vec2(0.5, -0.5)
                          );

        const colors = array<vec3<f32>, 3>(
                           vec3(0.0, 1.0, 1.0),
                           vec3(0.0, 0.0, 1.0),
                           vec3(1.0, 0.0, 1.0)
                       );

        @vertex
        fn main(@builtin(vertex_index) vertexIndex: u32) -> VSOutput {
            return VSOutput(
                vec4(positions[vertexIndex], 0.0, 1.0),
                vec4(colors[vertexIndex], 1.0)
            );
        }";

        var fragmentShader = "
                             @fragment
        fn main(@location(0) color: vec4<f32>) -> @location(0) vec4<f32> {
            return color;
        }
        ";

        var render = function(gpu:js.html.Gpu, canvasContext:js.html.GpuCanvasContext) {
            gpu.requestAdapter().then(function(adapter) {
                adapter.requestDevice().then(function(device) {
                    trace(device);
                    var format = gpu.getPreferredCanvasFormat();
                    var commandEncoder = device.createCommandEncoder();
                    var pipeline = device.createRenderPipeline({
                        layout: 'auto',
                        vertex: {
                            module: device.createShaderModule({ code: vertexShader }),
                            entryPoint: 'main'
                        },
                        fragment: {
                            module: device.createShaderModule({ code: fragmentShader }),
                            entryPoint: 'main',
                            targets: [{format: format}]
                        },
                        primitive: { topology: 'triangle-list' }
                    });
                    canvasContext.configure({ device:device, format:format, alphaMode: 'premultiplied' });
                    var passEncoder = commandEncoder.beginRenderPass({
                        colorAttachments: [
                        {
                            view: canvasContext.getCurrentTexture().createView(),
                            clearValue: { r: 0, g: 0.05, b: 0, a: 1 },
                            loadOp: 'clear',
                            storeOp: 'store'
                        }
                        ]
                    });
                    passEncoder.setPipeline(pipeline);
                    passEncoder.draw(3, 1, 0, 0);
                    passEncoder.end();
                    device.queue.submit([commandEncoder.finish()]);
                });
            });
        };

        if(untyped navigator.gpu) {
            var canvas:js.html.CanvasElement = cast js.Browser.document.getElementById("canvas");
            render(
                untyped navigator.gpu,
                canvas.getContext('webgpu')
            );
        } else {
            js.Browser.alert('WebGPU is not supported or is not enabled, see https://webgpu.io');
        }
    }
}
