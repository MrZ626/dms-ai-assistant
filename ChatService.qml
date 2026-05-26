// ChatService.qml
// 消息状态管理。暂时只处理用户消息（无 API 调用）。
// 后续阶段会在 sendMessage() 里加入 curl 调用来获取 AI 回复。

import QtQuick

Item {
    id: root

    // DMS 注入的插件 ID，用于读写设置
    property string pluginId: ""

    // ── 对外暴露的状态 ────────────────────────────────────────────

    // 消息列表，每项结构：{ role: "user"|"assistant", content: string }
    property ListModel messagesModel: ListModel {}

    // 等待 API 响应时为 true（第二阶段启用，现在始终为 false）
    property bool isLoading: false

    // ── 公开函数 ──────────────────────────────────────────────────

    // 发送消息：追加到列表（后续会在这里加 API 调用）
    function sendMessage(text) {
        if (!text || text.trim().length === 0)
            return
        messagesModel.append({ role: "user", content: text.trim() })
    }

    // 清空所有消息
    function clearHistory() {
        messagesModel.clear()
    }
}
