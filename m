Content-Type: multipart/mixed; boundary="===============3105362788220536473=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: d1b40ae9ca [ 18.779992] BUG: unable to handle kernel paging request at c0351cd8
Date: Fri, 17 Aug 2018 16:29:15 +0800
Message-ID: <e1157194-9de8-4627-1e08-28d158c8d766@intel.com>
In-Reply-To: <8736vrcujg.fsf@xmission.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3105362788220536473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 08/07/2018 12:46 AM, Eric W. Biederman wrote:
> kernel test robot <rong.a.chen@intel.com> writes:
>
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.=
git siginfo-testing
> I finally think I see what is going on.  fork_idle being confusing
> things with it's specialness.
>
> I have updated my branch once again to handle this case.  If you could
> place the branch above back into testing and let me know how it goes I
> would appreciate it.
the robot keeps track of the branch, and the branch looks fine so far.

Best Regards,
Rong Chen

>
> Thank you,
> Eric Biederman


--===============3105362788220536473==--

