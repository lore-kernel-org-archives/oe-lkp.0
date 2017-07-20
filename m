Content-Type: multipart/mixed; boundary="===============1794865679337931892=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Thu, 20 Jul 2017 22:50:52 +0800
Message-ID: <20170720145052.GA18464@yexl-desktop>
In-Reply-To: <CA+55aFwuebKQ0-sAiRJWpMcaVJ8MjXvCg56DO5q8jMiPDXvc8A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1794865679337931892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, fengguang

On 07/19, Linus Torvalds wrote:
>Hmm. I wonder why the kernel test robot ends up having that annoying
>line doubling for the dmesg.
>

I found that the line doubling issue should be caused by setting
"earlyprintk=3DttyS0,115200" and "console=3DttyS0,115200" at the same time =
in
kernel parameter via debugging with `lkp qemu`, could I just omit one of th=
em?
any side effect it may bring? or I can solve this issue by uniq the dmesg l=
og
in report?

Thanks,
Xiaolong

--===============1794865679337931892==--

