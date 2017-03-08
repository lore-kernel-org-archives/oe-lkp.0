Content-Type: multipart/mixed; boundary="===============3489346770803294743=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Wed, 08 Mar 2017 23:51:42 +0100
Message-ID: <58C08AFE.2000504@iogearbox.net>
In-Reply-To: <CAGXu5jLB_+47FEJYTYJ5u6-u+vOBpWo_0tWuiNKnGmuMjL-mMQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3489346770803294743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/08/2017 11:36 PM, Kees Cook wrote:
> On Wed, Mar 8, 2017 at 2:27 PM, Daniel Borkmann <daniel@iogearbox.net> =
wrote:
>> [   28.474232] rodata_test: test data was not read only
>> [...]
>
> In my tests so far, I've never been able to get rodata_test to fail
> (Qemu 2.5.0, Ubuntu). I'll retry with your .config and see if I can
> recheck under Qemu 2.7.1. Do you see these failures on real hardware?

The x86_64 tests on real hardware, and the x86-32 only in the qemu
environment with the reproducer script. Haven't tested x86-32 kernel
outside of qemu so far.

Thanks,
Daniel

--===============3489346770803294743==--

