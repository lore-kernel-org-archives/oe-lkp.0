Content-Type: multipart/mixed; boundary="===============5902940331099547584=="
MIME-Version: 1.0
From: Richard Palethorpe <rpalethorpe@suse.de>
To: lkp@lists.01.org
Subject: Re: [LTP] 3239b6f29b ("KEYS: return full count in keyring_read() if buffer is too small"): ltp.keyctl06.fail
Date: Tue, 05 Dec 2017 10:43:08 +0100
Message-ID: <87a7yxmrwz.fsf@rpws.prws.suse.cz>
In-Reply-To: <20171201192152.GD142348@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5902940331099547584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Eric Biggers writes:

> On Fri, Dec 01, 2017 at 10:40:12AM +0800, Fengguang Wu wrote:
>> Hi Eric,
>> =

>> We noticed LTP keyctl06 test regression in
>> =

>> commit: 3239b6f29bdfb4b0a2ba59df995fc9e6f4df7f1f ("KEYS: return full cou=
nt in keyring_read() if buffer is too small")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> =

>> on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz wi=
th 64G memory
>> with following parameters:
>> =

>> 	disk: 1HDD
>> 	fs: ext4
>> 	test: syscalls_part2
>> =

>> test-description: The LTP testsuite contains a collection of tools for t=
esting the Linux kernel and related features.
>> test-url: http://linux-test-project.github.io/
>> =

>> To reproduce:
>> =

>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp install job.yaml  # job file is attached in this email
>>          bin/lkp run     job.yaml
>> =

>> testcase/path_params/tbox_group/run: ltp/1HDD-ext4-syscalls_part2/ivb44
>> =

>
> Did this include LTP commit f21703fe45d3 ("syscalls/keyctl06: update to t=
est for
> follow-on fix")?  It would be really helpful if these reports would inclu=
de the
> LTP commit that was used.
>
> Eric

We are getting the following result, even with the follow up patch:

keyctl06.c:68: FAIL: KEYCTL_READ returned 4 but expected 8

This is with SUSE SLE15 kernel 4.12.14. I haven't had chance to
investigate it yet.

-- =

Thank you,
Richard.

--===============5902940331099547584==--

