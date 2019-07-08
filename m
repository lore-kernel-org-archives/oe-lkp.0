Content-Type: multipart/mixed; boundary="===============0077789744873704468=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] selftests/seccomp/seccomp_bpf: update for PTRACE_GET_SYSCALL_INFO
Date: Mon, 08 Jul 2019 11:41:24 -0700
Message-ID: <CALCETrUAMh-U1a3a_YBw0V8oQHhVKteMOwdUYwzQJi8HVeVWWg@mail.gmail.com>
In-Reply-To: <20190708182904.GA12332@altlinux.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0077789744873704468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2019 at 11:29 AM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> The syscall entry/exit is now exposed via PTRACE_GETEVENTMSG,
> update the test accordingly.

Reviewed-by: Andy Lutomirski <luto@kernel.org>

--===============0077789744873704468==--

