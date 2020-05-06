using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ApplyPulse : MonoBehaviour
{
    Renderer rend;
    float pulse=0;
    float count = 0;
    bool applyPulse = true;
    // Start is called before the first frame update
    void Start()
    {
        rend = GetComponent<Renderer>();
    }

    // Update is called once per frame
    void Update()
    {
        if (applyPulse)
        {
            pulse = Mathf.Abs(Mathf.Sin(count/6)) / 2;
            count++;
            rend.material.SetFloat("_Amount", pulse);
            StartCoroutine(WaitPulse());
        }
        
    }
    IEnumerator WaitPulse()
    {
        yield return new WaitForSeconds(0.3f);
        applyPulse = false;
        yield return new WaitForSeconds(2f);
        applyPulse = true;
    }
}
