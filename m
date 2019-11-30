Content-Type: multipart/mixed; boundary="===============0390154702593571199=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: Re: [x86/mm/pat] 8d04a5f97a: phoronix-test-suite.glmark2.0.score -23.7% regression
Date: Sat, 30 Nov 2019 13:27:29 -0800
Message-ID: <20191130212729.ykxstm5kj2p5ir6q@linux-p48b>
In-Reply-To: <CAJTyqKPstH9PYk1nMuRJWnXUPTf9wAkphPFi9Yfz6PApLVVE0Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0390154702593571199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 30 Nov 2019, Mariusz Ceier wrote:

>I can also confirm this - just bisected framebuffer rendering
>performance regression on amdgpu and
>8d04a5f97a5fa9d7afdf46eda3a5ceaa973a1bcc is the first bad commit
>(leading to drop from around 260-300fps to about 60fps in CS:GO on
>Fury X).

This is a third report now. Could you please provide the contents
of the following file, before and after the offending commit.

	/sys/kernel/debug/x86/pat_memtype_list

This will show any attribute differences in the tree, which is likely
the culprit.

Thanks,
Davidlohr
--===============0390154702593571199==--

