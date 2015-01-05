Content-Type: multipart/mixed; boundary="===============3317784961158887952=="
MIME-Version: 1.0
From: Rusty Russell <rusty@rustcorp.com.au>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/radeon: Try to init amdkfd only if 64 bit kernel
Date: Mon, 05 Jan 2015 14:58:54 +1030
Message-ID: <87r3v96ebd.fsf@rustcorp.com.au>
In-Reply-To: <549A85DE.1040006@amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3317784961158887952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oded Gabbay <oded.gabbay@amd.com> writes:
> On 12/24/2014 01:01 AM, Rusty Russell wrote:
>> Oded Gabbay <oded.gabbay@amd.com> writes:
>>> I didn't say it doesn't always work.
>>> The actual thing that doesn't work is the define symbol_get and only in=
 a
>>> specific case of 32bit kernel AND CONFIG_MODULES is unset AND
>>> CONFIG_RANDOMIZE_BASE is set.
>>> The define in that case is:
>>> #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak)); &(x)=
; })
>>>
>>> Why it doesn't work (doesn't return NULL when symbol doesn't exists) ?
>>
>> Hmm, I'd guess CONFIG_RANDOMIZE_BASE is relocating NULL symbols...
>>
>> No, I can't reproduce this.  Please send your .config privately.
>>
>> Here's my test case:
>>
>> diff --git a/init/main.c b/init/main.c
>> index 61b993767db5..a3ee1ec97ec3 100644
>> --- a/init/main.c
>> +++ b/init/main.c
>> @@ -683,6 +683,12 @@ asmlinkage __visible void __init start_kernel(void)
>>
>>   	ftrace_init();
>>
>> +	{
>> +		extern void nonexistent_fn(void);
>> +		printk("symbol_get(nonexistent_fn) =3D %p\n",
>> +		       symbol_get(nonexistent_fn));
>> +	}
>> +
>>   	/* Do the rest non-__init'ed, we're now alive */
>>   	rest_init();
>>   }
>>
>> Thanks,
>> Rusty.
>>
> Hi Rusty,
>
> Attached is the bad config file. (config-bad)
> I have narrowed the changes you need to do to the config file in order to =

> reproduce this bug.
> The base assumption is a 32-bit kernel and without modules support. Rest =
of the =

> config file is pretty standard, IMO.
> Then, its not enough to enable CONFIG_RANDOMIZE_BASE like I wrote in my o=
riginal =

> post. You need also to unset CONFIG_HIBERNATION.

Indeed, thanks; your config breaks as reported.  With CONFIG_HIBERNATION
the kernel offset is 0, so we don't see this.

Kees, as far as I can tell you need another 0-terminated vmlinux.relocs
section for weak symbols.  These should not be relocated if already 0.

Put this somewhere to test.  It fails for x86_64, too:

diff --git a/init/main.c b/init/main.c
index 61b993767db5..c9e0195c792a 100644
--- a/init/main.c
+++ b/init/main.c
@@ -683,6 +683,12 @@ asmlinkage __visible void __init start_kernel(void)
 =

 	ftrace_init();
 =

+	{
+		extern void __attribute__((weak)) nonexistent_fn(void);
+		printk("nonexistent_fn =3D %p\n", nonexistent_fn);
+		BUG_ON(nonexistent_fn !=3D NULL);
+	}
+
 	/* Do the rest non-__init'ed, we're now alive */
 	rest_init();
 }

Cheers,
Rusty.

--===============3317784961158887952==--

