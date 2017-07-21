Content-Type: multipart/mixed; boundary="===============2830138123907271568=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Fri, 21 Jul 2017 09:30:01 +0800
Message-ID: <20170721013001.liames3lkhnqwmvj@wfg-t540p.sh.intel.com>
In-Reply-To: <20170720145052.GA18464@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2830138123907271568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

On Thu, Jul 20, 2017 at 10:50:52PM +0800, Ye Xiaolong wrote:
>Hi, fengguang
>
>On 07/19, Linus Torvalds wrote:
>>Hmm. I wonder why the kernel test robot ends up having that annoying
>>line doubling for the dmesg.
>>
>
>I found that the line doubling issue should be caused by setting
>"earlyprintk=3DttyS0,115200" and "console=3DttyS0,115200" at the same time=
 in
>kernel parameter via debugging with `lkp qemu`, could I just omit one of t=
hem?

That's a good finding. I guess it's better to tell that fact and let
the community know (more) about this caveat of earlyprintk and
possibly (plan to) fix it.

>any side effect it may bring? or I can solve this issue by uniq the dmesg =
log
>in report?

Then we can offer the option to strip the duplicate lines in dmesg in
our robot. It looks like trivial to do in fixup_dmesg():

https://stackoverflow.com/questions/22067201/how-to-delete-duplicate-lines-=
in-file-in-unix

sed -r '$!N; /^(.*)\n\1$/!P; D' filename

Thanks,
Fengguang

--===============2830138123907271568==--

