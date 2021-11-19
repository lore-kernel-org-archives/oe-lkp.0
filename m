Content-Type: multipart/mixed; boundary="===============6122032943705443888=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/2] signal: Don't always set SA_IMMUTABLE for forced signals
Date: Fri, 19 Nov 2021 09:03:56 -0600
Message-ID: <87r1bcp4pv.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <CAP045Aose7Lg_OE0-MijGBg27gWo+Sk3hbxuN3AtQ8OPC9w9+w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6122032943705443888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Kyle Huey <me@kylehuey.com> writes:

> On Thu, Nov 18, 2021 at 2:05 PM Eric W. Biederman <ebiederm@xmission.co=
m> wrote:
>>
>>
>> Recently to prevent issues with SECCOMP_RET_KILL and similar signals
>> being changed before they are delivered SA_IMMUTABLE was added.
>>
>> Unfortunately this broke debuggers[1][2] which reasonably expect to be
>> able to trap synchronous SIGTRAP and SIGSEGV even when the target
>> process is not configured to handle those signals.
>>
>> Update force_sig_to_task to support both the case when we can
>> allow the debugger to intercept and possibly ignore the
>> signal and the case when it is not safe to let userspace
>> known about the signal until the process has exited.
>
> s/known/know/

Fixed.


>> Reported-by: Kyle Huey <me@kylehuey.com>
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>> Cc: stable(a)vger.kernel.org
>> [1] https://lkml.kernel.org/r/CAP045AoMY4xf8aC_4QU_-j7obuEPYgTcnQQP3Yxk=
=3D2X90jtpjw(a)mail.gmail.com
>> [2] https://lkml.kernel.org/r/20211117150258.GB5403(a)xsang-OptiPlex-902
>
> This link doesn't work.

Shame.  I missed a trailing 0, but unfortunately that request did not go
to list that is archived on lore.  I will keep the link on the chance
the message winds up in a lore archive in the future.

Eric
--===============6122032943705443888==--

