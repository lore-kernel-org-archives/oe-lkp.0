Content-Type: multipart/mixed; boundary="===============5556132467821196756=="
MIME-Version: 1.0
From: Oded Gabbay <oded.gabbay@amd.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/radeon: Try to init amdkfd only if 64 bit kernel
Date: Sun, 11 Jan 2015 13:57:59 +0200
Message-ID: <54B26547.2030400@amd.com>
In-Reply-To: <87mw5v4iug.fsf@rustcorp.com.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============5556132467821196756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 01/07/2015 12:58 AM, Rusty Russell wrote:
> Kees Cook <keescook@chromium.org> writes:
>> On Sun, Jan 4, 2015 at 8:28 PM, Rusty Russell <rusty@rustcorp.com.au> =
wrote:
>>> Kees, as far as I can tell you need another 0-terminated vmlinux.relocs
>>> section for weak symbols.  These should not be relocated if already 0.
>>
>> A few questions:
>>
>> Why doesn't this break on 32-bit without kASLR? 32-bit does relocation
>> by default, even without CONFIG_RANDOMIZE_BASE.
> =

> Well, the offset was 0 until I removed CONFIG_HIBERNATE.
> =

>> Are there any symbols that are NULL that aren't weak? I'd expect all
>> strong symbols to have non-zero offsets, but I must be
>> misunderstanding something here.
> =

> I don't think there would be.  Anyway, you might be able to filter them
> out in x86/tools/relocs itself.
> =

> Cheers,
> Rusty.
> =


Hi Kees,

Did you had time to look at the problem ?

	Oded

--===============5556132467821196756==--

