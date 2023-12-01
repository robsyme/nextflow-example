process DoSomething {
    publishDir "${params.outdir}/results", mode: 'copy', saveAs: { originalFilename -> "greeting.${name}.txt" }

    input: 
    val(name)

    output:
    path("*.txt")

    script:
    """
    echo "Heya ${name}" > greeting.txt
    """
}

workflow {
    Channel.of("Rob", "Dillon")
    | map { it.toUpperCase() }
    | DoSomething
}