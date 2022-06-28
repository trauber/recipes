rm -f tags/*

for r in recipes/*.md; do
    tags+=" "$(recipemd -j "$r" | jq -r '.tags | join(" ")')
done

tag_array=($tags)
sorted_unique_tag_array=$(echo "${tag_array[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' ')

for t in $sorted_unique_tag_array; do
    echo "# $t " > tags/${t}.md
done


for r in recipes/*; do
    tags=$(recipemd -j "$r" | jq -r '.tags | join(" ")')
    title=$(recipemd -t "$r")
    for t in $tags; do
        echo "- [${title}](../${r})" >> tags/${t}.md
    done
done
