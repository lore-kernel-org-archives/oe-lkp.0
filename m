Content-Type: multipart/mixed; boundary="===============3409972898152877235=="
MIME-Version: 1.0
From: Cong Wang <xiyou.wangcong@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 486ad79630 [ 15.532543] BUG: unable to handle kernel NULL pointer dereference at 0000000000000004
Date: Wed, 02 May 2018 21:58:25 -0700
Message-ID: <CAM_iQpVDtrGCqd7NQ1vJXTuLMdz=GwbnN77vdkmY+PxtFmKHTw@mail.gmail.com>
In-Reply-To: <20180502212735.7660515ac03cf61630f5ff6b@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3409972898152877235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 2, 2018 at 9:27 PM, Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> So it's saying that something which got committed into Linus's tree
> after 4.17-rc3 has caused a NULL deref in
> sock_release->llc_ui_release+0x3a/0xd0

Do you mean it contains commit 3a04ce7130a7
("llc: fix NULL pointer deref for SOCK_ZAPPED")?

--===============3409972898152877235==--

