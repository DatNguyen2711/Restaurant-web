import { NextRequest, NextResponse } from "next/server";

import { prisma } from "@/utils/connect";
import { getAuthSession } from "@/utils/auth";
export const GET = async (req: NextRequest) => {
  const session = await getAuthSession();

  if (session) {
    try {
      if (session.user.isAdmin) {
        const orders = await prisma.order.findMany();
        return new NextResponse(JSON.stringify(orders), { status: 200 });
      }

      const orders = await prisma.order.findMany({
        where: {
          userEmail: session.user.email!,
        },
      });
      return new NextResponse(JSON.stringify(orders), { status: 200 });
    } catch (error) {
      console.log(error);
      return new NextResponse(
        JSON.stringify({ message: "something went wrong" }),
        { status: 200 }
      );
    }
  } else {
    return new NextResponse(
      JSON.stringify({ message: "Your are not authenticated" }),
      { status: 401 }
    );
  }
};
export const POST = () => {
  return new NextResponse("hello", { status: 200 });
};
