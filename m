Content-Type: multipart/mixed; boundary="===============2255786507827027543=="
MIME-Version: 1.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915] 396e33ae20: [drm:intel_set_cpu_fifo_underrun_reporting [i915]] *ERROR* uncleared fifo underrun on pipe B
Date: Thu, 17 Mar 2016 12:27:53 +0100
Message-ID: <56EA94B9.8040401@linux.intel.com>
In-Reply-To: <CAJ75kXZyC4PkX+4Y4H4vfPbuj=oj9NHLA_RC9aMB_p6ak0DRuQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2255786507827027543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Op 17-03-16 om 11:49 schreef William Dauchy:
> On Mon, Jan 11, 2016 at 2:35 AM, kernel test robot
> <ying.huang@linux.intel.com> wrote:
>> FYI, we noticed the below changes on
>>
>> git://anongit.freedesktop.org/drm-intel drm-intel-next-queued
>> commit 396e33ae204f52abebec9e578f44c749305500f4 ("drm/i915: Add two-stag=
e ILK-style watermark programming (v10)")
>>
>>
>> +--------------------------------------------------+------------+-------=
-----+
>> |                                                  | 2dfb0b816d | 396e33=
ae20 |
>> +--------------------------------------------------+------------+-------=
-----+
>> | boot_successes                                   | 8          | 19    =
     |
>> | boot_failures                                    | 0          | 4     =
     |
>> | drm:intel_set_cpu_fifo_underrun_reporting[i915]] | 0          | 4     =
     |
>> | drm:intel_cpu_fifo_underrun_irq_handler[i915]]   | 0          | 4     =
     |
>> | drm:intel_set_pch_fifo_underrun_reporting[i915]] | 0          | 4     =
     |
>> | drm:intel_pch_fifo_underrun_irq_handler[i915]]   | 0          | 4     =
     |
>> +--------------------------------------------------+------------+-------=
-----+
>>
>>
>>
>> [   36.077826] NFS: Registering the id_resolver key type
>> [   36.078178] Key type id_resolver registered
>> [   36.078444] Key type id_legacy registered
>> [   60.884026] [drm:intel_set_cpu_fifo_underrun_reporting [i915]] *ERROR=
* uncleared fifo underrun on pipe B
>> [   60.884659] [drm:intel_cpu_fifo_underrun_irq_handler [i915]] *ERROR* =
CPU pipe B FIFO underrun
>> [   60.885221] [drm:intel_set_pch_fifo_underrun_reporting [i915]] *ERROR=
* uncleared pch fifo underrun on pch transcoder B
>> [   60.885887] [drm:intel_pch_fifo_underrun_irq_handler [i915]] *ERROR* =
PCH transcoder B FIFO underrun
>> [   61.180651] random: nonblocking pool is initialized
>> [   81.430503] [drm:intel_set_cpu_fifo_underrun_reporting [i915]] *ERROR=
* uncleared fifo underrun on pipe C
>> [   81.431193] [drm:intel_cpu_fifo_underrun_irq_handler [i915]] *ERROR* =
CPU pipe C FIFO underrun
>> [   81.431782] [drm:intel_set_pch_fifo_underrun_reporting [i915]] *ERROR=
* uncleared pch fifo underrun on pch transcoder C
>> [   81.432474] [drm:intel_pch_fifo_underrun_irq_handler [i915]] *ERROR* =
PCH transcoder C FIFO underrun
>>
>>
>> To reproduce:
>>
>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
> I am still triggering these errors on v4.4.6
> Does anybody knows if there is a fix in queue? What can I do to help
> debug this issue?
>
Does it happen with latest -nightly?

~Maarten

--===============2255786507827027543==--

