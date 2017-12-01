Content-Type: multipart/mixed; boundary="===============6592031692520432111=="
MIME-Version: 1.0
From: Eric Biggers <ebiggers@google.com>
To: lkp@lists.01.org
Subject: Re: 3239b6f29b ("KEYS: return full count in keyring_read() if buffer is too small"): ltp.keyctl06.fail
Date: Fri, 01 Dec 2017 11:21:52 -0800
Message-ID: <20171201192152.GD142348@google.com>
In-Reply-To: <20171201024012.wsq3xnsbbdqwxwp2@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6592031692520432111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2017 at 10:40:12AM +0800, Fengguang Wu wrote:
> Hi Eric,
> =

> We noticed LTP keyctl06 test regression in
> =

> commit: 3239b6f29bdfb4b0a2ba59df995fc9e6f4df7f1f ("KEYS: return full coun=
t in keyring_read() if buffer is too small")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz wit=
h 64G memory
> with following parameters:
> =

> 	disk: 1HDD
> 	fs: ext4
> 	test: syscalls_part2
> =

> test-description: The LTP testsuite contains a collection of tools for te=
sting the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> testcase/path_params/tbox_group/run: ltp/1HDD-ext4-syscalls_part2/ivb44
> =


Did this include LTP commit f21703fe45d3 ("syscalls/keyctl06: update to tes=
t for
follow-on fix")?  It would be really helpful if these reports would include=
 the
LTP commit that was used.

Eric

--===============6592031692520432111==--

