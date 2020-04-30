using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeShaderColor : MonoBehaviour
{
    private int count = 0;
    private Color color;
    private float changeStatus=0;
    private int changingIndex = 0;
    private int indexSize = 3;
    bool isIncreasing = true;
    Renderer rend;
    // Start is called before the first frame update
    void Start()
    {
        rend = GetComponent<Renderer>();
        color[0] = 0;
        color[1] = 1;
        color[2] = 1;
    }

    // Update is called once per frame
    void Update()
    {
        rend.material.SetColor("_BaseColor", color);
        ChangeColor();
    }

    void ChangeColor()
    {
        color[changingIndex] = changeStatus;
        if (isIncreasing)
        {
            changeStatus += 0.02f;
        }
        else
        {
            changeStatus -= 0.02f;
        }
        if (changeStatus >= 1)
        {
            isIncreasing = false;
            changingIndex++;
            changingIndex = changingIndex % indexSize;
        }
        if (changeStatus <= 0)
        {
            isIncreasing = true;
            changingIndex++;
            changingIndex = changingIndex % indexSize;
        }
    }
}
