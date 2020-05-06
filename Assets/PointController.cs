using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PointController : MonoBehaviour
{
    //MeshFilter meshfilter;
    void Start()
    {
        MeshFilter meshfilter = GetComponent<MeshFilter>();
        meshfilter.mesh.SetIndices(meshfilter.mesh.GetIndices(0), MeshTopology.Points, 0);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
