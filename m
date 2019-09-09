Content-Type: multipart/mixed; boundary="===============7810369747020345528=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Mon, 09 Sep 2019 16:12:37 +0200
Message-ID: <6806e973-4cf7-bcac-54b4-4fac21698ece@suse.de>
In-Reply-To: <20190904062716.GC5541@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7810369747020345528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.09.19 um 08:27 schrieb Feng Tang:
> Hi Thomas,
> =

> On Wed, Aug 28, 2019 at 12:51:40PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 28.08.19 um 11:37 schrieb Rong Chen:
>>> Hi Thomas,
>>>
>>> On 8/28/19 1:16 AM, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 27.08.19 um 14:33 schrieb Chen, Rong A:
>>>>> Both patches have little impact on the performance from our side.
>>>> Thanks for testing. Too bad they doesn't solve the issue.
>>>>
>>>> There's another patch attached. Could you please tests this as well?
>>>> Thanks a lot!
>>>>
>>>> The patch comes from Daniel Vetter after discussing the problem on IRC.
>>>> The idea of the patch is that the old mgag200 code might display much
>>>> less frames that the generic code, because mgag200 only prints from
>>>> non-atomic context. If we simulate this with the generic code, we shou=
ld
>>>> see roughly the original performance.
>>>>
>>>>
>>>
>>> It's cool, the patch "usecansleep.patch" can fix the issue.
>>
>> Thank you for testing. But don't get too excited, because the patch
>> simulates a bug that was present in the original mgag200 code. A
>> significant number of frames are simply skipped. That is apparently the
>> reason why it's faster.
> =

> Thanks for the detailed info, so the original code skips time-consuming
> work inside atomic context on purpose. Is there any space to optmise it?
> If 2 scheduled update worker are handled at almost same time, can one be
> skipped?

We discussed ideas on IRC and decided that screen updates could be
synchronized with vblank intervals. This may give some rate limiting to
the output.

If you like, you could try the patch set at [1]. It adds the respective
code to console and mgag200.

Best regards
Thomas

[1]
https://lists.freedesktop.org/archives/dri-devel/2019-September/234850.html

> =

> Thanks,
> Feng
> =

>>
>> Best regards
>> Thomas

-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--===============7810369747020345528==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxMlhkVUFDZ2tRYUEzQkhWTUwKZWlQMzl3Z0FoajVxZ01tN3VI
bzhkZmZDeDUvUnJFVjFUUHphUGN1cnVoSStjSUIwVUxGOFplRko1TzRQcHhtTgpTM1oxaGg0cTNt
N2pSbEo4V09GeGZxSExGeTRpVTFmR0ZMOTlNN2xIaXRvSExJdHRtdlJDOVFhM3lBNHYzWjZ6CnRE
K2YrL096bTk1NHZnS2hsa0VhZHNtRjhWdmtlT0xuNlhYOE8rSlZnK3J4cERNbUVCVm9DbllXRGp5
cytONGoKN01WRUhuS1ZIZTNIZjF2WlZDYTY5TkNsc3ZwalJTZE51QVNkUXpxanV3allERkRZV2dy
UVdYa0ZsNHNCcm1uNwo2Q0tTQ2JmUmJrQmZCNzM5dkIzV2xLM1g5Uk53S3pLNjJUbndKSnB0UnRU
NjJsRFhMbEJ0QndDMk1zQmlCR2g3ClY5Rk9ZRGxVVHhLVVdmN0JjVU4xSmpVNy9LbDRkdz09Cj1X
UDY2Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7810369747020345528==--

