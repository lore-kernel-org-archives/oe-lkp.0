Content-Type: multipart/mixed; boundary="===============6016670013724407206=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/deadline] kernel BUG at kernel/sched/deadline.c:805!
Date: Mon, 16 Feb 2015 13:49:50 +0100
Message-ID: <20150216124950.GA5029@twins.programming.kicks-ass.net>
In-Reply-To: <20150216072038.GA17056@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6016670013724407206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 03:20:38PM +0800, Fengguang Wu wrote:
> Elapsed time: 25
> qemu-system-x86_64 -cpu kvm64 -enable-kvm -kernel /kernel/i386-randconfig=
-x1-02152111/1019a359d3dc4b64d0e1e5a5efcb725d5e83994d/vmlinuz-3.19.0-rc6-00=
041-g1019a35 =


But you 'forgot' to include the .config for this particular randconfig ^

Now I could probably figure it out from the reported crash and dmesg,
but please, just always include the used .config.

--===============6016670013724407206==--

