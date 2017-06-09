#include <irrlicht.h>

using namespace irr;

//scene::ISceneNode *node = 0;

class MyEventReceiver : public IEventReceiver {
    public:
        MyEventReceiver(scene::ISceneNode* node) {
            this->node = node;
        }

        virtual bool OnEvent(const SEvent& event) {
            if (node != 0 && event.EventType == irr::EET_KEY_INPUT_EVENT &&
                    !event.KeyInput.PressedDown)
            {
                core::vector3df v = node->getPosition();
                switch(event.KeyInput.Key) {
                    case KEY_KEY_W:
                    case KEY_KEY_S:
                        v.Y += event.KeyInput.Key == KEY_KEY_W ?
                            2.0f : -2.0f;
                        node->setPosition(v);
                        break;
                    case KEY_KEY_A:
                    case KEY_KEY_D:
                        v.X += event.KeyInput.Key == KEY_KEY_D ?
                            2.0f : -2.0f;
                        node->setPosition(v);
                        break;
                    default: break;
                }
                return true;
            }
            return false;
        }

    private:
        scene::ISceneNode* node;
};
