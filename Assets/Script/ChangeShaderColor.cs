using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeShaderColor : MonoBehaviour
{
    private int count = 0;
    // Start is called before the first frame update
    void Start()
    {
        GetComponent<Renderer>().material.SetColor("_BaseColor", Color.blue);
    }

    // Update is called once per frame
    void Update()
    {
        count++;
        if (count % 120 == 0)
        {
            GetComponent<Renderer>().material.SetColor("_BaseColor", Color.green);
        }
    }
}
