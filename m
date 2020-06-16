Content-Type: multipart/mixed; boundary="===============6118944731641199900=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] e44e907dd8: phoronix-test-suite.glmark2.800x600.score -64.9% regression
Date: Tue, 16 Jun 2020 16:24:30 +0200
Message-ID: <8345c20c-4794-87d5-4464-c284b8e9cf73@suse.de>
In-Reply-To: <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6118944731641199900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.06.20 um 22:58 schrieb Emil Velikov:
> Hi all,
> =

> On Thu, 4 Jun 2020 at 08:11, kernel test robot <rong.a.chen@intel.com> =
wrote:
>>
>> Greeting,
>>
>> FYI, we noticed a -64.9% regression of phoronix-test-suite.glmark2.800x6=
00.score due to commit:
>>
> On one hand, I'm really happy to see performance testing happening
> although this report is missing various crucial pieces of information.
> =

>> commit: e44e907dd8f937313d35615d799d54162c56d173 ("[PATCH v3 05/15] drm/=
mgag200: Split MISC register update into PLL selection, SYNC and I/O")
>> url: https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-mgag=
200-Convert-to-atomic-modesetting/20200515-163744
>> base: git://anongit.freedesktop.org/drm/drm-tip drm-tip
>>
>> in testcase: phoronix-test-suite
>> on test machine: 16 threads Intel(R) Xeon(R) CPU X5570 @ 2.93GHz with 48=
G memory
>> with following parameters:
>>
>>         need_x: true
> Replace "need_x" with the Xorg version as seen in `Xorg -version'.
> =

>>         test: glmark2-1.1.0
>>         cpufreq_governor: performance
>>         ucode: 0x1d
>>
>> test-description: The Phoronix Test Suite is the most comprehensive test=
ing and benchmarking platform available that provides an extensible framewo=
rk for which new tests can be easily added.
>> test-url: http://www.phoronix-test-suite.com/
>>
> Please remove the test description and url. They don't add any value.
> =

> Mention which Mesa version is used as well as on what GPU. The output
> of lspci and glxinfo will help here.
> =

> For this particular test - there is no Mesa/upstream driver for this
> GPU, so I imagine one of the swrast drivers was used. Which one -
> swrast (classic, softpipe, llvmpipe, swr) or kms_swrast.
> The output of `LD_DEBUG=3Dlibs glxinfo  |& grep _dri.so` will help here.
> =

>> commit:
>>   bef2303526 ("drm/mgag200: Move mode-setting code into separate helper =
function")
>>   e44e907dd8 ("drm/mgag200: Split MISC register update into PLL selectio=
n, SYNC and I/O")
>>
> =

> Actually the offending commit has a subtle change of behaviour - it
> adds an extra MGAREG_MISC_RAMMAPEN.
> That is not documented and I've failed to spot it during review.
> =

> Thomas - shall we revert that line in itself or at least add an inline
> comment why it is needed?

Oh, well spotted. I'll send out a patch to not set the bit. Hopefully
this will resolve the problem.

> =

>>
>>   100 +-----------------------------------------------------------------=
----+
>>    90 |-+    +      +   +.+      +    +     +    +      +   :           =
    |
>>       | :    :      :   : :      :    :     :    :      :   :           =
    |
>>    80 |-:    :      :   : :      :    :     :    :      :   :           =
    |
>>    70 |-::   :     ::   :  :     :   ::     ::   :     ::  :            =
    |
>>       |: :  : :    : : :   :    : :  : :   : :  : :    : : :            =
    |
>>    60 |:+:  : :    : : :   :    : :  : :   : :  : :    : : :            =
    |
>>    50 |:+:  : :    : : :   :    : :  : :   : :  : :    : : :            =
    |
>>    40 |:+ : : :   :  : :    :   : : :  :   :  : : :   :  : :            =
    |
>>       |:  : : :   :  : :    :   : : :  :   :  : : :   :  : :O      O O O=
  O |
>>    30 |:+ : : :   :  : :    :   : : :  :   :  : : :   :  : :            =
    |
>>    20 |-+ ::   :  :   :     :  :   ::   : :   ::   :  : O :             =
    |
>>       |    :   : :    :      : :   :    : :    :   : :    :             =
    |
>>    10 |-+  :   : :    :      : :   :    : :    :   : :    :             =
    |
>>     0 +-----------------------------------------------------------------=
----+
>>
>>
>>                    phoronix-test-suite.glmark2.1024x768.score
>>
>>   70 +------------------------------------------------------------------=
----+
>>      | +    +      +   +..+     +    +      +    +     +    +.+         =
    |
>>   60 |-:    :      :   :  :     :    :      :    :     :    :           =
    |
>>      | :    :      :   :  :     :    :      :    :     :    :           =
    |
>>   50 |-::   :     ::   :  :     ::   :      :   ::     ::   :           =
    |
>>      |: :  : :    : : :    :   : :  : :    : :  : :   : :  :            =
    |
>>   40 |:+:  : :    : : :    :   : :  : :    : :  : :   : :  :            =
    |
>>      |: :  : :    : : :    :   : :  : :    : :  : :   : :  :         O  =
    |
>>   30 |:+ : : :   :  : :    :   :  : : :    : : :  :   :  : :O      O   O=
  O |
>>      |:  : : :   :  : :    :   :  : : :    : : :  :   :  : :            =
    |
>>   20 |:+ : : :   :  : :    :   :  : : :    : : :  :   :  : :            =
    |
>>      |   ::   :  :   :      : :   ::   :  :   ::   : : O ::             =
    |
>>   10 |-+  :   : :    :      : :    :   :  :   :    : :    :             =
    |
>>      |    :   : :  O :    O : : O  :   :  : O :    : :    :             =
    |
>>    0 +------------------------------------------------------------------=
----+
>>
>>
>> [*] bisect-good sample
>> [O] bisect-bad  sample
>>
> Hmm I must be going blind - there isn't even a single * in either of the =
graphs.
> Or perhaps my eyesight is fine and the legend or the graphs need fixing.

I cannot make sense of these graphs. The axis' should have descriptive
labels.

Best regards
Thomas

> =

> HTH
> -Emil
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--===============6118944731641199900==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWw3bzFoNEFDZ2tRYUEzQkhWTUwKZWlQeDhnZjlHQ00rMDgrWHJ5
YXlOQmEvdU5oMVBUUWlNQVNCRFlieW5CalBFRnNPNDZxV3I0RmhTcHJwendQRQo3NDVKc2ljbFoy
SmVKZjhJV1ozV3dsSGNrU1ZZUmMyaWJ5ME4rWDE0UHRLeGdIY0JVeEpIcldxL00wRm0xUjNNCjhi
bUMwRWRMdVI5VEtNTHZKdE83SVZpUFpxN2ZxR080Wjg0SDBZbkpiZmRseDBnME5HYUlSdy8xOVVE
bUh5UUkKUTBLbDNNRnZ4aFVDckZwWEROMDdQRHcvN0VaNzdtUzJETWRWMXllYldkQTI4NGsrWmhj
cndEaytrYVZmOHFSWgprNGNXN1FlYm9UbFZWd1QrUDdaMFdJTUhmSTg5aElPdmRSK1JsMjNKNmF1
ZWZmS1hUYnNJNnNsRlhNZGZFQ2d2CmE4VnpTdzVYWHl3WmtYNktVZ3pQMURCekFEaDgrUT09Cj1C
bWxrCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============6118944731641199900==--

