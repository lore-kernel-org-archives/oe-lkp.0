Content-Type: multipart/mixed; boundary="===============1543838016261351755=="
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
To: lkp@lists.01.org
Subject: Re: [kernel] 247f5d7caa: will-it-scale.per_process_ops 9.6% improvement
Date: Fri, 21 Feb 2020 17:29:10 +0100
Message-ID: <CAG48ez0iUi6Qag4M2Y7=SfgJy5nET61NDB=aJ1yDS=GFJ--LZA@mail.gmail.com>
In-Reply-To: <20200221115542.GL14493@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1543838016261351755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 12:56 PM kernel test robot
<rong.a.chen@intel.com> wrote:
[...]
>                             will-it-scale.per_process_ops
>
>   83000 +----------------------------------------------------------------=
---+
>   82000 |-+                                        O O      O O          =
   |
>         |    O O O    O     O  O O      O O O                      O     =
   |
>   81000 |-O        O    O O        O O         O O      O O      O   O   =
 O |
>   80000 |-+                                                            O =
   |
>         |                                                                =
   |
>   79000 |-+                                                              =
   |
>   78000 |-+                                                              =
   |
>   77000 |-+                                                              =
   |
>         |                                                                =
   |
>   76000 |-+                                                              =
   |
>   75000 |-+                                                              =
   |
>         |.      .+.             .+.      .+.+..     .+..                 =
   |
>   74000 |-+..+.+   +..+.+.+.+..+   +.+..+      +.+.+    +.+.+.+..+.+     =
   |
>   73000 +----------------------------------------------------------------=
---+
>
>
>                                 will-it-scale.workload
>
>   1.32e+06 +-------------------------------------------------------------=
---+
>            |   O  O O   O      O   O        O O                          =
   |
>    1.3e+06 |-O        O   O O    O   O O O        O        O     O O     =
 O |
>   1.28e+06 |-+                                  O        O            O O=
   |
>            |                                                             =
   |
>   1.26e+06 |-+                                                           =
   |
>            |                                                             =
   |
>   1.24e+06 |-+                                                           =
   |
>            |                                                             =
   |
>   1.22e+06 |-+                                                           =
   |
>    1.2e+06 |-+                                                           =
   |
>            |                                                             =
   |
>   1.18e+06 |.+.+..+.+.+. .+.+..+.+.+.+.+.+..+.+.+.+.+.+..+.+. .+. .+     =
   |
>            |            +                                    +   +       =
   |
>   1.16e+06 +-------------------------------------------------------------=
---+
>
>
> [*] bisect-good sample
> [O] bisect-bad  sample

Some comments on the report format:

"O" appears in the graphs, but not "*". Is "+" supposed to be the
"bisect-good sample"? Also, what do "per_process_ops" and "workload"
mean - are higher numbers better or worse? And what does "bisect-good"
and "bisect-bad" even mean in the context of a performance
*improvement* - is the "good" commit the newer one and the "bad" one
the older one?
--===============1543838016261351755==--

