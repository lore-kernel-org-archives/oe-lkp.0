Content-Type: multipart/mixed; boundary="===============4702431388737411292=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 913ec479bb: vm-scalability.throughput 26.2% improvement
Date: Sat, 29 Aug 2020 20:06:04 +0200
Message-ID: <f9664139-e28c-ba8e-b4e4-d505baf9069a@suse.de>
In-Reply-To: <99c7683c-f428-378d-2b19-ef51270a5d8e@oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4702431388737411292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.08.20 um 16:56 schrieb Mike Kravetz:
> On 8/27/20 2:16 AM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 26.08.20 um 10:58 schrieb kernel test robot:
>>> Greeting,
>>>
>>> FYI, we noticed a 26.2% improvement of vm-scalability.throughput due to=
 commit:
>>
>> I guess this resolves the once-measured performance penalty of similar
>> magnitude. But do we really understand these tests? When I sent out
>> patches to resolve the problem, nothing changed. And suddenly the
>> performance is back to normal.
>>
>> Best regards
>> Thomas
>>
>>>
>>>
>>> commit: 913ec479bb5cc27f99f24d5fd111b3ef29a4deb9 ("drm/mgag200: Replace=
 VRAM helpers with SHMEM helpers")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>
>>>
>>> in testcase: vm-scalability
>>> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz w=
ith 80G memory
>>> with following parameters:
>>>
>>> 	runtime: 300s
>>> 	size: 8T
>>> 	test: anon-cow-seq-hugetlb
>>> 	cpufreq_governor: performance
>>> 	ucode: 0x11
> =

> Hello Thomas,
> =

> Did drm changes really impact anon-cow-seq-hugetlb performance?
> =

> My change c0d0381ade79 ("hugetlbfs: use i_mmap_rwsem for more pmd sharing
> synchronization") caused a -33.4% regression of anon-cow-seq-hugetlb.  A
> recent change 34ae204f185 (hugetlbfs: remove call to huge_pte_alloc witho=
ut
> i_mmap_rwsem) was tested by Zhengjun Xing and improved performance by 20
> something percent.  That seems in line with this report/improvement.

Some of DRM's memory management might be affected by hugetable changes.
While I cannot really point to a specific location, it's not impossible
that there's a connection.

> =

> Perhaps the tooling is not always accurate in determining the commit which
> causes the performance changes?
> Perhaps I am misreading information in the reports?
> =


>From what I remember, some of these tests print to the console, which
has always been slow, and has generally been a bad idea for performance
tests. I guess these tests are not very accurate.

Best regards
Thomas

-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--===============4702431388737411292==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRklCQUVCQ0FBeUZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWw5S21ROFVISFI2YVcxdFpYSnQKWVc1dVFITjFjMlV1WkdVQUNn
a1FhQTNCSFZNTGVpTVlxZ2YrSUxNV1ZnSFNuTXg1YjB2dlljdmpNN1R1TG5qOApGL2hLMkd4RDNz
UDAxWkkyUi8rU3dvUEZKT3BibDRycTJrcTdrL0J4cUJnTk5tdXlSMjlpWlFXcGNtR2VIVzZ1ClEv
enpSc2FNU2xrMVBuTzFoYVBxQWxVNVhRVVQxZFRuOXpyMUpVRDFVczkyVURKc2RKbW05Wlp4OHBa
Tlk0TXAKbEo2am5oTnhxckNnR2ljYzJ0OGdCRUpleGxtYUVlcWwyR2poUFluY0pHeWJkSCtVOVpD
Y1doUUkvaS9aUGMveAp3UWlxNlpDNm5PMHV1b1ZPd090YUtvSlN0eFk5aDdrZWYxd3dpSzE5clUx
YmJFU3dyTWRCNXFFTWFTMG1rUnhCCnY4UFNWY2NTeUgyMk1KdmxQZnV3SmtmQTJPMFVDT3lpRzVZ
bGsvSHVkL1F5WGFzZmtGcCtoZ3phc3c9PQo9djIxWQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0t
LS0K

--===============4702431388737411292==--

