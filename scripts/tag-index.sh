for r in recipes/*.md; do
    tags+=" "$(recipemd -j "$r" | jq -r '.tags | join(" ")')
done

tag_array=($tags)
sorted_unique_tag_array=$(echo "${tag_array[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' ')

for t in $sorted_unique_tag_array; do
    echo "- [$t](tags/$t.md)"
done
