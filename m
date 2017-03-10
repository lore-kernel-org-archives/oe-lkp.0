Content-Type: multipart/mixed; boundary="===============1377952873516854207=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] ed3ce2a917: BUG:unable_to_handle_kernel
Date: Fri, 10 Mar 2017 10:33:08 +0800
Message-ID: <20170310023308.GF17010@yexl-desktop>
In-Reply-To: <20170309081401.7nk6ngcz4eznohi5@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============1377952873516854207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/09, Borislav Petkov wrote:
>On Thu, Mar 09, 2017 at 10:13:10AM +0800, Ye Xiaolong wrote:
>> >Anyway, the diff is below, please try that ontop of tip's x86/asm branch
>> >which already has the clear_page patch:
>> >
>> >http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/log/?h=3Dx86/asm
>> >
>> >Thanks!
>> =

>> Hmm, I've checkout the tip's x86/asm branch (HEAD is f25d38475 "x86/asm:
>> Optimize clear_page()"), but I failed to apply your diff on top of it (e=
rror
>> log as below).
>
>Right, Ingo merged the diff I gave you already into the patch there
>so that x86/asm already contains the fixed version. You could run the
>current tip/x86/asm branch to confirm that it fixes the issue for you.

Previous kernel bug is gone for 10 times test of HEAD of tip/x86/asm. (f25d=
3847
"x86/asm: Optimize clear_page()")

Tested-by: Xiaolong Ye <xiaolong.ye@intel.com>

Thanks,
Xiaolong
>
>Thanks.
>
>-- =

>Regards/Gruss,
>    Boris.
>
>Good mailing practices for 400: avoid top-posting and trim the reply.

--===============1377952873516854207==--

