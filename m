Content-Type: multipart/mixed; boundary="===============1612178890330624142=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched, cpumask] 9475ceda45: -6% regression of hackbench.throughput
Date: Tue, 16 May 2017 15:05:22 +0200
Message-ID: <20170516130522.qhfqqwtwimlrawpm@hirez.programming.kicks-ass.net>
In-Reply-To: <20170516013349.GB23599@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1612178890330624142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2017 at 09:33:49AM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> We noticed a -6% regression of hackbench.throughput due to commit:
> =

> commit: 9475ceda453545fc55b2ccf30b1fbed0e590fdca ("sched,cpumask: Export =
for_each_cpu_wrap()")
> https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git schd/wip

OK, so that patch fixes an actual bug in the for_each_cpu_wrap()
implementation.

$ gcc -O2 -o find-bit find-bit.c ; ./find-bit 0xF00100100F 16
100100f 16
---
24
36
37
38
39
0
1
2
3
12
---
24
36
38
1
3
12
---
24
36
37
38
39
0
1
2
3
12


See how the second series is much shorter..

This, on top of the 'old' kernel will 'fix' things and regress the same.


 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4f1825d..3316da6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5656,7 +5656,7 @@ static int cpumask_next_wrap(int n, const struct cpum=
ask *mask, int start, int *
 	int next;
 =

 again:
-	next =3D find_next_bit(cpumask_bits(mask), nr_cpumask_bits, n+1);
+	next =3D find_next_bit(cpumask_bits(mask), nr_cpumask_bits, n);
 =

 	if (*wrapped) {
 		if (next >=3D start)




---

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#define nr_bits	(sizeof(unsigned long)*8)

int find_first_bit(unsigned long mask)
{
	if (mask)
		return __builtin_ffsl(mask) - 1;

	return nr_bits;
}

int find_next_bit(int bit, unsigned long mask)
{
	return find_first_bit(mask & (~0UL << (bit + 1)));
}

#define for_each_bit(bit, mask)	\
	for ((bit) =3D find_first_bit(mask); (bit) < nr_bits; (bit) =3D find_next_=
bit((bit), (mask)))


int find_next_bit_wrap(int bit, unsigned long mask, int start, bool wrap)
{
	int next;

again:
	next =3D find_next_bit(bit, mask);

	if (wrap && bit < start && next >=3D start)
		return nr_bits;

	if (next >=3D nr_bits) {
		wrap =3D true;
		bit =3D -1;
		goto again;
	}

	return next;
}

#define for_each_bit_wrap(bit, mask, start)					\
	for ((bit) =3D find_next_bit_wrap((start)-1, (mask), (start), false);	\
	     (bit) < nr_bits;							\
	     (bit) =3D find_next_bit_wrap((bit), (mask), (start), true))


#define for_each_bit_wrap3(bit, mask, start, wrap) \
	for ((wrap) =3D false, (bit) =3D (start)-1; \
	     (bit) =3D find_next_bit_wrap((bit), (mask), (start), (wrap)), (bit) <=
 nr_bits; \
	     (wrap) =3D true)


static int find_next_bit_wrap2(int n, unsigned long mask, int start, int *w=
rapped)
{
       int next;

again:
       next =3D find_next_bit(n+1, mask);

       if (*wrapped) {
               if (next >=3D start)
                       return nr_bits;
       } else {
               if (next >=3D nr_bits) {
                       *wrapped =3D 1;
                       n =3D -1;
                       goto again;
               }
       }

       return next;
}

#define for_each_bit_wrap2(cpu, mask, start, wrap)                         =
    \
       for ((wrap) =3D 0, (cpu) =3D (start)-1;                             =
        \
               (cpu) =3D find_next_bit_wrap2((cpu), (mask), (start), &(wrap=
)),    \
               (cpu) < nr_bits; )

void main(int argc, char *argv[])
{
	unsigned long mask;
	int bit, start, wrap;

	if (argc > 1)
		mask =3D strtoul(argv[1], NULL, 16);
	if (argc > 2)
		start =3D atoi(argv[2]);

	printf("%x %d\n", mask, start);

	printf("---\n");

	for_each_bit_wrap(bit, mask, start)
		printf("%d\n", bit);

	printf("---\n");

	for_each_bit_wrap2(bit, mask, start, wrap)
		printf("%d\n", bit);

	printf("---\n");

	for_each_bit_wrap3(bit, mask, start, wrap)
		printf("%d\n", bit);

}

--===============1612178890330624142==--

