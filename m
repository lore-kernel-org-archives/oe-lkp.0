Content-Type: multipart/mixed; boundary="===============5287333966798421881=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: [console_unlock] BUG: KASAN: use-after-scope in console_unlock+0x9cd/0xd10
Date: Thu, 19 Apr 2018 11:50:20 +0200
Message-ID: <CACT4Y+ZL_xY-HJwgU+XQ-onqe+coxbNGOBno6HrPHwYuPdHRFA@mail.gmail.com>
In-Reply-To: <20180419065531.l6kblbziddplgcwi@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5287333966798421881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 19, 2018 at 8:55 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> On Thu, Apr 19, 2018 at 03:20:50PM +0900, Sergey Senozhatsky wrote:
>>
>> On (04/19/18 08:04), Dmitry Vyukov wrote:
>> [..]
>>>
>>> We could also make them mutually exclusive in config to prevent people
>>> from hitting these false positives again and again.
>>
>>
>> Let's do it. Ard and Kees agreed on making them mutually exclusive [1][2=
].
>> Dmitry, could send out a patch?
>>
>> [1]
>> lkml.kernel.org/r/CAKv+Gu8HN-t2om8sCfjxCWbsgSir54fZw222dsed0Xwqph2aNg(a)=
mail.gmail.com
>> [2]
>> lkml.kernel.org/r/CAGXu5j+mcfo4aB3PM1We6O62bFBJcMFX-9obJE4jFU1Dp=3DgNwg(=
a)mail.gmail.com
>
>
> That'd be great, thank you very much!


Just mailed "KASAN: prohibit KASAN+STRUCTLEAK combination":
https://groups.google.com/d/msg/kasan-dev/Y1TEh7ZlHTQ/wR36C8uMCgAJ

--===============5287333966798421881==--

