Content-Type: multipart/mixed; boundary="===============3382846142495162059=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Wed, 08 Mar 2017 14:36:04 -0800
Message-ID: <CAGXu5jLB_+47FEJYTYJ5u6-u+vOBpWo_0tWuiNKnGmuMjL-mMQ@mail.gmail.com>
In-Reply-To: <58C08535.3070000@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3382846142495162059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2017 at 2:27 PM, Daniel Borkmann <daniel@iogearbox.net> wr=
ote:
> [   28.474232] rodata_test: test data was not read only
> [...]

In my tests so far, I've never been able to get rodata_test to fail
(Qemu 2.5.0, Ubuntu). I'll retry with your .config and see if I can
recheck under Qemu 2.7.1. Do you see these failures on real hardware?

-Kees

-- =

Kees Cook
Pixel Security

--===============3382846142495162059==--

