export function buildImagePayload(images, originalImages) {
    const files = [];
    const order = [];
    const keptExistingIds = new Set();

    images.forEach((image) => {
        if (image.source === "queued") {
            const index = files.push(image.file) - 1;
            order.push(`new:${index}`);
        } else {
            order.push(image.token);
            keptExistingIds.add(image.id);
        }
    });

    const removedImageIds = originalImages
        .filter((image) => !keptExistingIds.has(image.id))
        .map((image) => image.id);

    return { files, order, removedImageIds };
}
