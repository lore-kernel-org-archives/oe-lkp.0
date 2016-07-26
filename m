Content-Type: multipart/mixed; boundary="===============1696947741820936478=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: More information please. Re: [fs] 54cc07a761: BUG: kernel test crashed
Date: Tue, 26 Jul 2016 14:50:58 -0500
Message-ID: <87wpk8p49p.fsf@x220.int.ebiederm.org>
In-Reply-To: <20160726151344.GB8811@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1696947741820936478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fengguang Wu <fengguang.wu@intel.com> writes:

> On Tue, Jul 26, 2016 at 09:52:40AM -0500, Eric W. Biederman wrote:
>>Fengguang Wu <fengguang.wu@intel.com> writes:
>>> On Mon, Jul 25, 2016 at 01:57:00PM -0500, Eric W. Biederman wrote:
>>>>kernel test robot <xiaolong.ye@intel.com> writes:
>>[snip]
>>>>>
>>>>> [   19.206454] VFS: Warning: trinity-c0 using old stat() call. Recomp=
ile your binary.
>>>>>
>>>>> Elapsed time: 70
>>>>> BUG: kernel test crashed
>>>>
>>>>What application generated the line "BUG: kernel test crashed."
>>>>What flavor of crash was this?
>>>
>>> It's a simple boot test with a quick trinity run. So there will be
>>> some randomness in this test.
>>>
>>> The "BUG: kernel test crashed" means the VM reboots by itself while
>>> the trinity test is running. If the error message is "BUG: kernel boot
>>> crashed" it'd mean VM abnormally reboots before any test is launched.
>>
>>Is it possible to include a url pointing to a page of documentation
>>holding this information in your emails or alternatively a url pointing
>>to some source code.  Just so other people don't have to ask you this
>>question.
>
> Yes that's the right directions to follow. We'll make the reports more
> understandable and the test/bisects more reliable.

Thanks.  Does trinity have a random seed it can export/import to rerun
the same tests?  I ask because there was a failure these tests caught
that if the right kernel options was enabled was 100% reliable and it
blamed a commit 10 patches down from the indicated commit.  The problem
being 100% reproducible it wasn't an issue that the indicated commit
was wrong.  But a 100% reliable failure being misattributed suggest
a way attribution could become more reliable.

> In particular, I suspect this false report might be related to QEMU
> watchdog. The wild guess is, if trinity touches the watchdog device by
> accident, it may result in the VM reset w/o any symptom.

Interesting.  I hope it is the watchdog.  I know some qemu versions +
some kernel versions have race conditions that are observable during
boot.  I don't know if those happen in your test harness but it may be
worth a look.  I tend to get grumpy when I see those and work on
stabalizing a magic kernel config that likes qemu, but I keep finding
issues when I try other peoples configurations for reproducing problems
like this one.

Eric




--===============1696947741820936478==--

