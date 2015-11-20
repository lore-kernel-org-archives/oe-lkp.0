Content-Type: multipart/mixed; boundary="===============1936869424574084597=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: hugepage compaction causes performance drop
Date: Fri, 20 Nov 2015 16:55:01 +0800
Message-ID: <564EDFE5.5010709@intel.com>
In-Reply-To: <564DCEA6.3000802@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1936869424574084597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/19/2015 09:29 PM, Vlastimil Babka wrote:
> +CC Andrea, David, Joonsoo
> =

> On 11/19/2015 10:29 AM, Aaron Lu wrote:
>> The vmstat and perf-profile are also attached, please let me know if you
>> need any more information, thanks.
> =

> Output from vmstat (the tool) isn't much useful here, a periodic "cat =

> /proc/vmstat" would be much better.

No problem.

> The perf profiles are somewhat weirdly sorted by children cost (?), but =

> I noticed a very high cost (46%) in pageblock_pfn_to_page(). This could =

> be due to a very large but sparsely populated zone. Could you provide =

> /proc/zoneinfo?

Is a one time /proc/zoneinfo enough or also a periodic one?

> If the compaction scanners behave strangely due to a bug, enabling the =

> ftrace compaction tracepoints should help find the cause. That might =

> produce a very large output, but maybe it would be enough to see some =

> parts of it (i.e. towards beginning, middle, end of the experiment).

I'll see how to do this, never used ftrace before.

Thanks for the quick response.

Regards,
Aaron

--===============1936869424574084597==--

