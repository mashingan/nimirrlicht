#include <irrlicht.h>
using namespace irr;

class CSampleSceneNode: public scene::ISceneNode {
    core::aabbox3d<f32> Box;
    video::S3DVertex Vertices[4];
    video::SMaterial Material;

    public:
    CSampleSceneNode(scene::ISceneNode* parent, scene::ISceneManager* mgr,
            s32 id) : scene::ISceneNode(parent, mgr, id)
    {
        Material.Wireframe = false;
        Material.Lighting = false;

        Vertices[0] = video::S3DVertex(0, 0, 10, 1, 1, 0,
                video::SColor(255,0,255,255), 0, 1);
        Vertices[1] = video::S3DVertex(10, 0, -10, 1, 0, 0,
                video::SColor(255, 255, 0, 255),1,1);
        Vertices[2] = video::S3DVertex(0, 20, 0, 0, 1, 1,
                video::SColor(255, 255, 255, 0), 1, 0);
        Vertices[3] = video::S3DVertex(-10, 0, -10, 0, 0, 1,
                video::SColor(255, 0, 255, 0), 0, 0);

        Box.reset(Vertices[0].Pos);
        for (s32 i = 1; i < 4; ++i)
            Box.addInternalPoint(Vertices[i].Pos);
    }

    virtual void OnRegisterSceneNode() {
        if (IsVisible)
            SceneManager->registerNodeForRendering(this);
        ISceneNode::OnRegisterSceneNode();
    }

    virtual void render() {
        u16 indices[] = { 0,2,3, 2,1,3, 1,0,3, 2,0,1 };
        video::IVideoDriver* driver = SceneManager->getVideoDriver();

        driver->setMaterial(Material);
        driver->setTransform(video::ETS_WORLD, AbsoluteTransformation);
        driver->drawIndexedTriangleList(&Vertices[0], 4, &indices[0], 4);
    }

    virtual const core::aabbox3d<f32>& getBoundingBox() const {
        return Box;
    }

    virtual u32 getMaterialCount() { return 1; }
    virtual video::SMaterial& getMaterial(u32 i) {
        return Material;
    }
};
